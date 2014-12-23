Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3RK0-0000Yo-3u
 for ath10k@lists.infradead.org; Tue, 23 Dec 2014 15:24:28 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: fix low TX rates when IBSS and HT
References: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Tue, 23 Dec 2014 17:23:59 +0200
In-Reply-To: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Tue, 16 Dec 2014 09:52:59 +0100")
Message-ID: <87fvc6e6eo.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> This fix TX problem when IBSS used in HT mode.
> Before we used 6Mbps all the time for TX direction.
>
> Reported-by: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
