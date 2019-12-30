pragma solidity ^0.5.0;

contract Election {
    //Modelo de candidato
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //Guardar candidatos
    mapping(uint=>Candidate) public candidates;
    //Cuentas que votaron
    mapping(address=>bool) public voters;
    //Almacenar cantidad de candidatos
    uint public candidatesCount;    

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
    require (!voters[msg.sender]); //Requerir que no haya votado
    require (_candidateId > 0 && _candidateId <= candidatesCount); //Verificar ID de candidato valido
    voters[msg.sender] = true; //Marcar que la cuenta ya votó
    candidates[_candidateId].voteCount++; //Sumar el voto al candidato
    }
}