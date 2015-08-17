Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRLhT-0001Q3-NG
 for ath10k@lists.infradead.org; Mon, 17 Aug 2015 14:47:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/2] ath10k: refactor phyerr event handlers
References: <1439473033-14724-1-git-send-email-rmani@qti.qualcomm.com>
Date: Mon, 17 Aug 2015 17:47:19 +0300
In-Reply-To: <1439473033-14724-1-git-send-email-rmani@qti.qualcomm.com> (Raja
 Mani's message of "Thu, 13 Aug 2015 19:07:12 +0530")
Message-ID: <87egj2dlag.fsf@kamboji.qca.qualcomm.com>
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
To: Raja Mani <rmani@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Raja Mani <rmani@qti.qualcomm.com> writes:

> Existing phyerr event handlers directly uses phyerr header format
> (ie, struct wmi_phyerr and struct wmi_phyerr_event) in the code
> exactly on how firmware packs it. This is the problem in 10.4 fw
> specific phyerr event handling where it uses different phyerror
> header format. Before adding 10.4 specific handler, little bit of
> refactor is done in existing phyerr handlers.
>
> Two new abstracted structures (struct wmi_phyerr_ev_hdr_arg and
> struct wmi_phyerr_ev_arg) are introduced to remove dependency of using
> firmware specific header format in the code. So that firmware specific
> phyerror handlers can populate values to abstracted structures and
> the following code can use abstracted struct for further operation.
>
> .pull_phyerr_hdr is added newly to pull common phyerr header info
> like tsf, buf_len, number of phyerr packed. Existing .pull_phyerr
> handler is changed and called to parse every sub phyerrs in the event.
>
> Validated these refactoring on qca988x hw2.0 using fw 10.2.4 version.
>
> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>

Thanks, both applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
