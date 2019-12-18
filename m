Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihOpB-00042N-48
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 02:12:31 +0000
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
References: <20191216220747.887-1-greearb@candelatech.com>
 <a2af03e9-8b53-b297-467b-d0f07b8a002b@newmedia-net.de>
 <b5d63d96-4ba6-bbab-bf1c-a61c6c437f37@newmedia-net.de>
 <80700614-679a-336e-bd9a-e88622e75c9a@candelatech.com>
 <4775d91a-9719-46f8-b0f2-979b8d86cf9f@newmedia-net.de>
 <CAMrEMU-vGB8uR-JZbD2vj4vXgWNHfFqcbsqB=gOqBBDZWGkzQA@mail.gmail.com>
 <11290a30-46e8-638e-4110-86e6b2eb3d3f@candelatech.com>
 <CAKR_QV+xNbAzzw12x3Ku49bHnERTxYRAK8AfUSwp_uOgNMbY4Q@mail.gmail.com>
 <a95e7f6d-1cb8-3188-aea4-233dce6f9330@candelatech.com>
 <CAKR_QVL0P4qYidtqLwhhacCOpx2iq+4RRhTXbGhfRnf2PUj5tA@mail.gmail.com>
 <CAKR_QV+KV1dR_QKjANL34DGJuyf3OSN8J6gs3bqcmiRCCzkdXA@mail.gmail.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <5e3f22d1-b8ba-d756-a15c-1e7ae56c1dad@newmedia-net.de>
Date: Wed, 18 Dec 2019 03:12:22 +0100
MIME-Version: 1.0
In-Reply-To: <CAKR_QV+KV1dR_QKjANL34DGJuyf3OSN8J6gs3bqcmiRCCzkdXA@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tom Psyborg <pozega.tomislav@gmail.com>, Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Justin Capella <justincapella@gmail.com>

i dont know what you want to compare here.

1. you compare 2 different wifi chipsets. both have different 
sensititivy and overall output power spec

2. both have different amount of antenna chains. which does make a 
difference in input sensitivity

3. the patch ben made has no effect on qca9880 chipsets. it only takes 
effect on 10.4 based chipsets like 9984


about noise floors in general. noise floors of -108 are bogus. there is 
a physical limit a noise level can be.
since drivers like ath9k are doing a cyclic calibration, the noise value 
might indeed change. but this calibration is
not running in realtime. its cyclic. i'm not aware if chipsets like 
qca988x are going the same way, but since qca988x
has sime similaries with ath9k chipsets unlike the newer 9984 variants, 
it could be. the 30 seconds mentioned
in the bug report fits to my expectations of the early noisefloor 
calibration which has a short delay and after success
turning to use a long delay. anyway. in this early calibration phase 
signals might change and will stabilize after. this isnt a issue
since your connection will work anyway even if it might take a little 
bit longer if you have poor signal levels

@ben. am i wrong or what do think?

Sebastian

Am 18.12.2019 um 00:37 schrieb Tom Psyborg:
> also noticed now that the noise floor changes with signal strength as
> described in this bug report:
> https://www.mail-archive.com/ath10k@lists.infradead.org/msg11553.html
>
> after wifi restart
>
> iwinfo:
>
> signal: -59dBm noise: -108dBm
>
> then goes to
>
> signal: -52dBm noise: -103dBm
>
> and finally drops to
>
> signal: -59dBm noise: -103dBm
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
