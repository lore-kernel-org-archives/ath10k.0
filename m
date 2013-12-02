Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnOA8-0005y5-Bs
 for ath10k@lists.infradead.org; Mon, 02 Dec 2013 07:43:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix multi BSSID with WPA on FW 10.1
References: <1385737763-10481-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 2 Dec 2013 09:42:55 +0200
In-Reply-To: <1385737763-10481-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Fri, 29 Nov 2013 16:09:23 +0100")
Message-ID: <87wqjnbsw0.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> FW 10.1 seems to require the default key index to
> be updated to point to group key after it is
> installed. Otherwise Txed frames are corrupted.
>
> Tested-by: Tomasz Skapski <tomasz.skapski@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I see few checkpatch warnings:

drivers/net/wireless/ath/ath10k/mac.c:2721: ERROR: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/mac.c:2722: ERROR: code indent should use tabs where possible
drivers/net/wireless/ath/ath10k/mac.c:2723: ERROR: code indent should use tabs where possible

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
