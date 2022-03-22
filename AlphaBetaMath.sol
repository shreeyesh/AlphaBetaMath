// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";


library ALPHABETAMath {
    using SafeMath for uint256;

    uint256 internal constant ALPHA = 1e8;
    uint256 internal constant halfALPHA = ALPHA / 2;

    uint256 internal constant BETA = 1e18;
    uint256 internal constant halfBETA = BETA / 2;

    uint256 internal constant ALPHA_BETA_RATIO = 1e10;

    function beta() internal pure returns (uint256) {
        return BETA;
    }
    function alpha() internal pure returns (uint256) {
        return ALPHA;
    }

    function halfbeta() internal pure returns (uint256) {
        return halfBETA;
    }

    function halfalpha() internal pure returns (uint256) {
        return halfALPHA;
    }

    function ALPHAMul(uint256 a, uint256 b) internal pure returns (uint256) {
        return halfALPHA.add(a.mul(b)).div(ALPHA);
    }

    function ALPHADiv(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 halfB = b / 2;

        return halfB.add(a.mul(ALPHA)).div(b);
    }

    function BETAMul(uint256 a, uint256 b) internal pure returns (uint256) {
        return halfBETA.add(a.mul(b)).div(BETA);
    }

    function BETADiv(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 halfB = b / 2;

        return halfB.add(a.mul(BETA)).div(b);
    }

    function BETAToALPHA(uint256 a) internal pure returns (uint256) {
        uint256 halfRatio = ALPHA_BETA_RATIO / 2;

        return halfRatio.add(a).div(ALPHA_BETA_RATIO);
    }

    function ALPHAToBETA(uint256 a) internal pure returns (uint256) {
        return a.mul(ALPHA_BETA_RATIO);
    }
    function BETAPow(uint256 x, uint256 n) internal pure returns (uint256 z) {

        z = n % 2 != 0 ? x : BETA;

        for (n /= 2; n != 0; n /= 2) {
            x = BETAMul(x, x);

            if (n % 2 != 0) {
                z = BETAMul(z, x);
            }
        }
    }

}
