Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZbuc-0001k5-Cb
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 09:43:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: fix beamformee VHT STS capability
References: <1441192820-8403-1-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 9 Sep 2015 12:42:58 +0300
In-Reply-To: <1441192820-8403-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 2 Sep 2015 13:20:19 +0200")
Message-ID: <87twr47wt9.fsf@kamboji.qca.qualcomm.com>
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

> The VHT STS CAP shall be reported by firmware to host, like in case of
> QCA99x0. For QCA6174 hw family this isn't set for some reason.
> So for this particular chips, let's assume it has the ability to
> support VHT NDP in up to 4 STSs (which is true by the way).
>
> Change the published beamformee STS cap accordingly to 3 or to what
> the firmware reports.
>
> Assumption so far, it suppose to be the num_rf_chains-1, was
> completely wrong.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, both patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
