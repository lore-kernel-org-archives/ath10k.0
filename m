Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2nam03on0073.outbound.protection.outlook.com
 ([104.47.42.73] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEhLI-0008EL-SR
 for ath10k@lists.infradead.org; Sat, 27 May 2017 19:25:42 +0000
From: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Subject: Re: [PATCH] Per chain RSSI reporting
References: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <CAJ-VmomiKOgV4pJWNKdOCzsUJZYEixvP4p5bQ9X1FBqAGk_o0w@mail.gmail.com>
 <SN1PR08MB137316C4132262145C58CEA3B0FD0@SN1PR08MB1373.namprd08.prod.outlook.com>
 <21095854-07c7-7586-6a6e-e60c11932b84@candelatech.com>
 <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
Message-ID: <8e314337-a1f0-5ed4-aa90-3f1a0e2d09fc@ethertronics.com>
Date: Sat, 27 May 2017 12:25:10 -0700
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmonp72WpT_aUVo_To+k676Ra8S165efPOyXRvvk=_W0YEQ@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

We see this inconsistent/incorrect reporting in our RF chamber.

Norik

On 05/27/2017 09:39 AM, Adrian Chadd wrote:
> On 27 May 2017 at 09:07, Ben Greear <greearb@candelatech.com> wrote:
>> At low encoding rates, especially if it switches to a single-chain encoding,
>> maybe the on-air signal really is stronger?
>>
>> Have you verified in some other manner than the signals reported by ath10k
>> are
>> wrong?
> Hiya,
>
> So yeah, multipath, higher TX rates == weaker TX signal, TPC, etc are
> all interesting to know about at the receiver. it's hard to separate
> that out from the noise sometimes, but in some controlled deployments
> its really obvious.
>
>
>
> -adrian
>
>


The contents of this transmission are Ethertronics Inc. Confidential and may contain proprietary or legally privileged information which may not be disclosed, copied or distributed without the express written consent of Ethertronics Inc. The information is intended to be for the use of the individual or entity named on this transmission. If you are not the intended recipient, be aware that any disclosure, copying, distribution or use of the contents of this information is prohibited. If you have received this transmission in error, please notify us by telephone immediately so that we can arrange for the retrieval of the original documents at no cost to you. Alternatively, notify the sender by replying to this transmission and delete the message without disclosing it. Thank you

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
