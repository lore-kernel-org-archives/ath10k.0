Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXop-0001RV-7n
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 11:48:44 +0000
Received: by mail-ot1-x344.google.com with SMTP id 66so2164405otd.9
 for <ath10k@lists.infradead.org>; Wed, 18 Dec 2019 03:48:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9431f1a2-a44e-9b81-72b0-9a703e1841ac@newmedia-net.de>
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
 <5e3f22d1-b8ba-d756-a15c-1e7ae56c1dad@newmedia-net.de>
 <8eae96cd-a94e-abc1-4750-73f931d657d6@candelatech.com>
 <9431f1a2-a44e-9b81-72b0-9a703e1841ac@newmedia-net.de>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 18 Dec 2019 12:48:41 +0100
Message-ID: <CAKR_QVKhe37QnRvfE0-0pHTjBtjMoTsZMMn6SkP+iV4HN8rRnw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Per-chain rssi should sum the secondary channels
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>, Justin Capella <justincapella@gmail.com>

On 18/12/2019, Sebastian Gottschall <s.gottschall@newmedia-net.de> wrote:
>
> Am 18.12.2019 um 03:37 schrieb Ben Greear:
>>
>>
>> On 12/17/2019 06:12 PM, Sebastian Gottschall wrote:
>>> i dont know what you want to compare here.
>>>
>>> 1. you compare 2 different wifi chipsets. both have different
>>> sensititivy and overall output power spec
>>>
>>> 2. both have different amount of antenna chains. which does make a
>>> difference in input sensitivity
>>>

both were connecting to 2x2 AP. 3x3 card should disable 3rd chain in
that case but driver doesn't do that yet.

> anyway. while this calibration is running, the signal and noise floor
> might be unstable or even bogus until this is finished and rate control
> might not be optimal
> under stress conditions like long range links with low signals.

i've noticed noise level switching between -105 and 0 on some high
5ghz channels between 2 litebeams (not very long range, less than 5km)
while signal levels are in -65 - -75dBm range

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
