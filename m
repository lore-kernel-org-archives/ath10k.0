Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acZf9-00030n-Rx
 for ath10k@lists.infradead.org; Sun, 06 Mar 2016 14:28:04 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 07/11] ath10k: implement wake_tx_queue
Date: Sun, 6 Mar 2016 14:27:37 +0000
Message-ID: <87ziubvfzm.fsf@kamboji.qca.qualcomm.com>
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-1-git-send-email-michal.kazior@tieto.com>
 <1456828376-2795-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1456828376-2795-8-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 1 Mar 2016 11:32:52 +0100")
Content-Language: en-US
Content-ID: <FC69EB540BCBFC4E8119749E030B9D2D@qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> This implements very basic support for software
> queueing. It also contains some knobs that will be
> patched later.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Oddly this patch introduces a new warning:

drivers/net/wireless/ath/ath10k/mac.c: In function ath10k_mac_op_tx:
drivers/net/wireless/ath/ath10k/mac.c:3949:29: warning: is_mgmt may be used uninitialized in this function [-Wuninitialized]

But I think that's just a false warning, most likely because my gcc is
ancient. Do you agree?

gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
