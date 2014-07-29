Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC3y0-0004aE-4U
 for ath10k@lists.infradead.org; Tue, 29 Jul 2014 09:45:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix aggregated 4addr Rx
References: <1406205374-24858-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 29 Jul 2014 12:44:36 +0300
In-Reply-To: <1406205374-24858-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 24 Jul 2014 14:36:14 +0200")
Message-ID: <8761igijnf.fsf@kamboji.qca.qualcomm.com>
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
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> A-MSDU 4addr frames weren't reconstructed properly
> and in some cases this resulted in a warning:
>
>  br0: received packet on wlan0.sta1 with own address as source address
>
> Since this was only related to A-MSDU it would
> trigger when more intense traffic was generated.
>
> Reported-by: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
