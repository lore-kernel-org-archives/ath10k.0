Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZ1wr-0000eL-GX
 for ath10k@lists.infradead.org; Thu, 25 Feb 2016 19:51:41 +0000
Message-ID: <56CF5AE3.70302@codeaurora.org>
Date: Thu, 25 Feb 2016 11:49:55 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: set MAC timestamp in management Rx frame
References: <4c705dc7a2c0aa857da4e6eaf6e8ed47c354b9ea.1456351768.git.poh@qca.qualcomm.com>
 <87k2lsd9zv.fsf@kamboji.qca.qualcomm.com> <56CF4DA3.8030803@codeaurora.org>
 <12890529.ZzYcJYx9dF@sven-edge>
In-Reply-To: <12890529.ZzYcJYx9dF@sven-edge>
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
To: Sven Eckelmann <sven@narfation.org>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, "Oh,
 Peter" <poh@qca.qualcomm.com>, ath10k@lists.infradead.org

Thank you!

On 02/25/2016 11:32 AM, Sven Eckelmann wrote:
> On Thursday 25 February 2016 10:53:23 Peter Oh wrote:
>>> I see new warnings:
>>>
>>> drivers/net/wireless/ath/ath10k/wmi.c:2199:16: warning: restricted
> __le32
>>> degrades to integer
>>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted
> __le32
>>> degrades to integer
>>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: cast to
> restricted
>>> __le32
>>> drivers/net/wireless/ath/ath10k/wmi.c:2201:41: warning: restricted
> __le32
>>> degrades to integer
>> Do I have a way to run this check before submitting a patch such as
>> checkpatch.pl?
> Looks like sparse with -D__CHECK_ENDIAN__ [1]
>
> You may also try smatch [2]
>
> Kind regards,
> 	Sven
>
> [1] https://www.kernel.org/doc/Documentation/sparse.txt
> [2] http://smatch.sourceforge.net/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
