Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YG72T-0002cs-7u
 for ath10k@lists.infradead.org; Tue, 27 Jan 2015 14:22:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: implement uapsd autotrigger command
References: <1421749497-10553-1-git-send-email-michal.kazior@tieto.com>
Date: Tue, 27 Jan 2015 16:22:12 +0200
In-Reply-To: <1421749497-10553-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 20 Jan 2015 11:24:56 +0100")
Message-ID: <87egqgb8x7.fsf@kamboji.qca.qualcomm.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> New wmi-tlv firmware for qca6174 has u-UAPSD
> autotrigger service. If it is enabled firmware
> generates trigger frames automatically as
> configured.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
