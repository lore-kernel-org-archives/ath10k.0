Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkCXc-0004Wq-Rl
 for ath10k@lists.infradead.org; Tue, 22 Aug 2017 17:00:38 +0000
Received: by mail-lf0-x244.google.com with SMTP id d202so2920394lfd.2
 for <ath10k@lists.infradead.org>; Tue, 22 Aug 2017 10:00:11 -0700 (PDT)
Subject: Re: [PATCH] ath10k: sdio: remove unused struct member
References: <1503153382-11100-1-git-send-email-erik.stromdahl@gmail.com>
 <a97bab8e-fd91-715d-918e-0074fe0ac3d6@qti.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <49816d2b-e081-657d-aca0-20402989e1ed@gmail.com>
Date: Tue, 22 Aug 2017 19:00:05 +0200
MIME-Version: 1.0
In-Reply-To: <a97bab8e-fd91-715d-918e-0074fe0ac3d6@qti.qualcomm.com>
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 2017-08-22 02:18, Ryan Hsu wrote:
> On 08/19/2017 07:36 AM, Erik Stromdahl wrote:
> 
>> irq_wq in struct ath10k_sdio is a remnant from an earlier
>> version of the sdio patchset.
>>
>> It's use was removed as a result of Kalle's review, but somehow
> 
> Its?
> 
Aah, of course.
It's of course supposed to be its:)

I'll fix it in v2.

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
