Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk0AP-0005ag-5J
 for ath10k@lists.infradead.org; Fri, 31 Oct 2014 00:34:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v3 0/3] ath10k: speed up recovery
References: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 31 Oct 2014 02:33:44 +0200
In-Reply-To: <1414488878-31561-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 28 Oct 2014 10:34:35 +0100")
Message-ID: <87h9yldqmv.fsf@kamboji.qca.qualcomm.com>
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

> Patch #1 fixes a bug I've found while testing
> patches #2 and #3. It's safe to cherry-pick it in
> case patches #2 and/or #3 aren't accepted or need
> a re-spin.
>
> I've mainly used patch #2 to test reset and
> recovery. It's pretty handy for (stress-)testing.
>
> Patch #3 should improve recovery speed in some
> cases. Notably when there's a long chain of WMI
> commands involved which take a painfully long time
> to timeout/complete if firmware crashes mid-way.
>
> Note: Patches #2 and #3 depend on `ath10k: pci
> related fixes 2014-10-09`. Without the patchset
> patches #2 and #3 must not be applied. Patch #1 is
> fine though.
>
> v3:
>  * skip shadow ring cleanup in #1
>
> Michal Kazior (3):
>   ath10k: fix possible bmi crash
>   ath10k: expose hw restart via debugfs
>   ath10k: speed up hw recovery

Thanks, all three patches applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
