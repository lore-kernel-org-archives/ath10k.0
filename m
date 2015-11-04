Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu2GQ-0000ia-5e
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 17:54:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: add QCA9377 hw1.0 support
References: <1446638015-23310-1-git-send-email-bartosz.markowski@tieto.com>
 <1446638015-23310-5-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 4 Nov 2015 19:53:45 +0200
In-Reply-To: <1446638015-23310-5-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 4 Nov 2015 12:53:35 +0100")
Message-ID: <87lhadbqhi.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Add new BMI target version and chip id revision. Register it
> on supported chips list.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

This one has whitespace issues:

drivers/net/wireless/ath/ath10k/core.c:163: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:163: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:164: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:164: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:165: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:165: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:166: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:166: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:167: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:167: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:168: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:168: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:169: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:169: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:170: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:170: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:171: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:171: please, no spaces at the start of a line
drivers/net/wireless/ath/ath10k/core.c:172: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/core.c:172: please, no spaces at the start of a line


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
