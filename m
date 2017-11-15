Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEuW9-0004v0-6Z
 for ath10k@lists.infradead.org; Wed, 15 Nov 2017 10:02:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: mesh point and ap mode on same interface
Date: Wed, 15 Nov 2017 10:01:36 +0000
Message-ID: <87po8jhncx.fsf@kamboji.qca.qualcomm.com>
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
 <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
 <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
 <7dc592a5-9381-f715-6ea7-0a8b8deee311@tu-bs.de>
 <CADjYELwdUxEap_z=_HD4DS4FEQ2_2HP3w9cvDU-BTFLoOTDipg@mail.gmail.com>
 <5c04c7fe-8cf8-ddd8-d6a7-f42629586a63@bowerswilkins.com>
 <067d234a-59f0-4175-55af-9354617057b9@tu-bs.de>
 <61192d3b-b4c7-f47e-2ff9-44e17595d6a9@bowerswilkins.com>
 <fc1993f5-8b83-4e74-7866-2adcf318ff5f@tu-bs.de>
 <03700343-7b5c-b21e-8b7b-2ac8c7d3258b@bowerswilkins.com>
In-Reply-To: <03700343-7b5c-b21e-8b7b-2ac8c7d3258b@bowerswilkins.com> (Peter
 Oh's message of "Wed, 8 Nov 2017 10:13:16 -0800")
Content-Language: en-US
MIME-Version: 1.0
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: "Harms, Hannes" <hannes.harms@tu-bs.de>, Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

(adding linux-wireless for a cfg80211 question)

Peter Oh <peter.oh@bowerswilkins.com> writes:
> On 11/08/2017 04:49 AM, Harms, Hannes wrote:
>
>> I found a solution for the problem:
>>
>> When joining the mesh with beacon interval  set  to 100
>> both  mesh and ap interface are coming up.
>>
>> > iw mesh0 mesh join my_mesh beacon-interval 100
>>
>> The default beacon interval is 1000 for mesh interfaces.
>> It seems that QCA9880 is not working
>> with different beacon intervals for ap + mesh.
>
> Good to hear that working. But mesh beacon interval 1000 which is
> default value should work. Any mesh beacon intervals of multiple of AP
> beacon intervals are supposed to work.
>
> (In other words, mesh beacon intervals that are not aligned by
>multiple of AP beacon intervals won't work). These are valid for both
>of QCA9880 and QCA4019 as far as I know.

It would be nice if ath10k could print a warning if the beacon intervals
are not compatible. Or is there a way to enforce the beacon interval
with help of cfg80211 or mac80211?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
