Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0svh-0003oc-Qz
 for ath10k@lists.infradead.org; Mon, 23 Nov 2015 15:21:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Adjust the RX packet pad offset at QCA99X0 4addr
 mode
References: <1445575816-4500-1-git-send-email-yanbol@qca.qualcomm.com>
Date: Mon, 23 Nov 2015 17:20:44 +0200
In-Reply-To: <1445575816-4500-1-git-send-email-yanbol@qca.qualcomm.com> (Yanbo
 Li's message of "Thu, 22 Oct 2015 21:50:16 -0700")
Message-ID: <87d1v0spwz.fsf@kamboji.qca.qualcomm.com>
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
To: Yanbo Li <yanbol@qca.qualcomm.com>
Cc: dreamfly281@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yanbo Li <yanbol@qca.qualcomm.com> writes:

> The QCA99X0 4 addresses RX packets pad 2 bytes at the beginning of
> MSDU instead the end of ieee80211 header to keep align. The currently
> RX data path can't parse the header correctly in this case. This
> patch fixes it for QCA99X0
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
