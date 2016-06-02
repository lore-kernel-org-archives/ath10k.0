Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8SSb-0005i6-A3
 for ath10k@lists.infradead.org; Thu, 02 Jun 2016 13:14:53 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT] ath10k: disable wake_tx_queue for older devices
Date: Thu, 2 Jun 2016 13:14:27 +0000
Message-ID: <87inxrzqa5.fsf@kamboji.qca.qualcomm.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 17 May 2016 14:47:01 +0200")
Content-Language: en-US
Content-ID: <26B6B867F3107349B12F5FCA77104AC7@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: "leroi.lists@gmail.com" <leroi.lists@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> Some setups suffer performance regressions with
> current wake_tx_queue implementation.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
> Hi Roman,
>
> Can you give this patch a try and see if it helps
> with your performance problems, please?

Did anyone seeing the performance regression manage to test this? It
would be good to get feedback, good or bad, before I push this to 4.7.

Full patch here:

https://patchwork.kernel.org/patch/9111981/

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
