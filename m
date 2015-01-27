Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YG6jZ-0000my-F0
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 14:03:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: reset chip before reading chip_id in probe
References: <1421407237-24159-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Jan 2015 16:02:19 +0200
In-Reply-To: <1421407237-24159-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 16 Jan 2015 12:20:35 +0100")
Message-ID: <87386wcoes.fsf@kamboji.qca.qualcomm.com>
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

> There are some very rare cases with some hardware
> configuration that the device doesn't init quickly
> enough in which case reading chip_id yielded 0.
> This caused driver to subsequently fail to setup
> the device.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, all three patches applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
