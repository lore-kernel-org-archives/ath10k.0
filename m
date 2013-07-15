Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UydLm-0005FZ-3X
 for ath10k@lists.infradead.org; Mon, 15 Jul 2013 07:37:38 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: pass also QOS Null frames through mgmt tx path
References: <1373624746-3244-1-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 15 Jul 2013 10:37:08 +0300
In-Reply-To: <1373624746-3244-1-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 12 Jul 2013 12:25:46 +0200")
Message-ID: <87mwpop93v.fsf@kamboji.qca.qualcomm.com>
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

> Fw will report wrong tx status for QOS Null frames
> sent through data tx path.
>
> This patch fixes station(s) keep alive detection
> triggered from wpa_supplicant/hostapd when work
> as AP/GO and WMM enabled.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

I think you mentioned privately that this patch should be dropped. Is
that still the case?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
