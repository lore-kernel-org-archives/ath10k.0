Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-dm3nam03on0074.outbound.protection.outlook.com
 ([104.47.41.74] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEhQk-0001es-Rn
 for ath10k@lists.infradead.org; Sat, 27 May 2017 19:31:20 +0000
Subject: Re: [PATCH] Per chain RSSI reporting
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
 <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <21095854-07c7-7586-6a6e-e60c11932b84@candelatech.com>
 <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
 <4A8583B3-FFB2-4BDE-8041-9478CAD9EF73@vorklift.com>
From: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Message-ID: <98efa255-b481-ce11-69d5-f2d141d44c2b@ethertronics.com>
Date: Sat, 27 May 2017 12:30:48 -0700
MIME-Version: 1.0
In-Reply-To: <4A8583B3-FFB2-4BDE-8041-9478CAD9EF73@vorklift.com>
Content-Language: en-US
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
To: Michael Ney <neym@vorklift.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Ben Greear <greearb@candelatech.com>, Adrian Chadd <adrian@freebsd.org>

Is there an enhanced or conflicting patch pending?


On 05/27/2017 10:56 AM, Michael Ney wrote:
> The submitted code also doesn't appear to handle RSSI per-peer which would be needed for any use when configured as an access point.
>
>> On May 27, 2017, at 12:39 PM, Adrian Chadd <adrian@freebsd.org> wrote:
>>
>> On 27 May 2017 at 09:07, Ben Greear <greearb@candelatech.com> wrote:
>>> At low encoding rates, especially if it switches to a single-chain encoding,
>>> maybe the on-air signal really is stronger?
>>>
>>> Have you verified in some other manner than the signals reported by ath10k
>>> are
>>> wrong?
>> Hiya,
>>
>> So yeah, multipath, higher TX rates == weaker TX signal, TPC, etc are
>> all interesting to know about at the receiver. it's hard to separate
>> that out from the noise sometimes, but in some controlled deployments
>> its really obvious.
>>
>>
>>
>> -adrian
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

The contents of this transmission are Ethertronics Inc. Confidential and may contain proprietary or legally privileged information which may not be disclosed, copied or distributed without the express written consent of Ethertronics Inc. The information is intended to be for the use of the individual or entity named on this transmission. If you are not the intended recipient, be aware that any disclosure, copying, distribution or use of the contents of this information is prohibited. If you have received this transmission in error, please notify us by telephone immediately so that we can arrange for the retrieval of the original documents at no cost to you. Alternatively, notify the sender by replying to this transmission and delete the message without disclosing it. Thank you

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
