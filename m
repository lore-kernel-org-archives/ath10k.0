Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdMLz-00047X-FQ
 for ath10k@lists.infradead.org; Wed, 01 Apr 2015 17:23:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't call quiet mode if it's not implemented
References: <1427200817-7407-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 1 Apr 2015 20:22:29 +0300
In-Reply-To: <1427200817-7407-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 24 Mar 2015 12:40:17 +0000")
Message-ID: <87k2xvyd9m.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> qca6174 and wmi-tlv doesn't have quiet mode
> implemented. Don't even attempt to call it. This
> fixes a warning when bringing first interface up:
>
>   failed to set quiet mode period 100 duarion 0 enabled 0 ret -95
>
> Fixes: 8515b5c79a54 ("ath10k: configure thermal throttle while powering up")
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
