Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWMox-00022d-7M
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 08:51:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: do not warn about unsupported vdev param
References: <1381821980-7966-1-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 16 Oct 2013 11:50:42 +0300
In-Reply-To: <1381821980-7966-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 15 Oct 2013 09:26:20 +0200")
Message-ID: <8761sx8uql.fsf@kamboji.qca.qualcomm.com>
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

> 10.X firmware does not support WMI_VDEV_PARAM_TX_ENCAP_TYPE.
> It's a known limitation and we should not warn about this.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
