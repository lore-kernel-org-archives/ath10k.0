Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyPoI-0001UI-Tu
 for ath10k@lists.infradead.org; Mon, 16 Nov 2015 19:51:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Fix the wrong RX rate idx report at 11G mode
References: <1447353370-24465-1-git-send-email-yanbol@qca.qualcomm.com>
Date: Mon, 16 Nov 2015 21:50:55 +0200
In-Reply-To: <1447353370-24465-1-git-send-email-yanbol@qca.qualcomm.com>
 (Yanbo Li's message of "Thu, 12 Nov 2015 10:36:10 -0800")
Message-ID: <87a8qd2068.fsf@kamboji.qca.qualcomm.com>
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

> The RX rate idx is not correctly for 11G mode OFDM packet.
> Because the bitrate table start with CCK index instead of OFDM.
>
> Signed-off-by: Yanbo Li <yanbol@qca.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
