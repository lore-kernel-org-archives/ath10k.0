Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfRup-0000bE-Iz
 for ath10k@lists.infradead.org; Sun, 19 Feb 2017 13:52:41 +0000
Received: by mail-lf0-x244.google.com with SMTP id 86so451658lfv.0
 for <ath10k@lists.infradead.org>; Sun, 19 Feb 2017 05:52:17 -0800 (PST)
Subject: Re: [RFC v3 0/8] ath10k sdio support
References: <7b204d34-b791-ea78-cf4e-90e8fe1b79fb@gmail.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <5a3ad65a-8cc0-ab1a-dc95-a5fd31035bd7@gmail.com>
Date: Sun, 19 Feb 2017 14:52:14 +0100
MIME-Version: 1.0
In-Reply-To: <7b204d34-b791-ea78-cf4e-90e8fe1b79fb@gmail.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ryanhsu@qca.qualcomm.com

Hej,

I just noticed that Ryan Hsu submitted two patches containing similar
functionality to what I have in my tree on github. They have not been
integrated in the ath master yet, but they have been added to master-pending.

Below are the commits I am talking about

bc1054a15be3c962c83aa22476a3e9c1266da792 ath10k: improve the firmware download time for QCA9377
db5af2a25bd8c1410ec4456d1d4f4e6ded2649ca ath10k: improve the firmware download time for QCA6174

Since some of my patches overlap with these I think it would be best if
I add these to my tree and rewrite my patches.

If they haven't made it into master before I submit my updated patch series
I will include them in my set.

Is this OK?

If they will be added to master soon there is no issue since I will of course
rebase to the latest ath-YYYYMMDDHHmm before I submit anything.

/Erik

On 2017-02-19 00:57, Valo, Kalle wrote:
> Erik Stromdahl <erik.stromdahl@gmail.com> writes:
>
>> I was actually about to email you about this.
>>
>> I have made a few more updates to the sdio code so I think it would be
>> best if I could submit a new series of patches based on this code (v4).
>>
>> Then you can tweak it (v5).
>>
>> It is only minor updates to the HIF layer (added QCA9377 support) and
>> a setup of some pll registers.
>
> Ok, that sounds good. I'll wait for v4.
>
>> btw, should I still mark them as RFC or should it be PATCH this time?
>>
>> If I go for PATCH, should the version be v4 or should I start from v1?
>
> v4 would be fine. Thanks.
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
