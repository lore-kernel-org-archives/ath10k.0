Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsrMm-0007xn-LF
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 10:59:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Do not limit RTS threshold value to 2347
References: <1416821930-3003-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Mon, 24 Nov 2014 12:59:08 +0200
In-Reply-To: <1416821930-3003-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Mon, 24 Nov 2014 15:08:49 +0530")
Message-ID: <87a93g7tkz.fsf@kamboji.qca.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

Please no patches with empty commit logs.

Also please send ath10k patches both to ath10k and linux-wireless lists.
This is important especially now that I'm experimenting with patchwork
and it won't see the patch otherwise.

Documentation is here:

http://wireless.kernel.org/en/users/Drivers/ath10k/sources#Submitting_patches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
