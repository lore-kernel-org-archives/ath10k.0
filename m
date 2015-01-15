Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBhnB-0003Vo-2r
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 10:36:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: document switch case fall-through in
 __ath10k_scan_finish
References: <1421096822-28698-1-git-send-email-linville@tuxdriver.com>
Date: Thu, 15 Jan 2015 12:36:15 +0200
In-Reply-To: <1421096822-28698-1-git-send-email-linville@tuxdriver.com> (John
 W. Linville's message of "Mon, 12 Jan 2015 16:07:02 -0500")
Message-ID: <87sifcxrds.fsf@kamboji.qca.qualcomm.com>
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
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

"John W. Linville" <linville@tuxdriver.com> writes:

> Add a comment for indicating that the ATH10K_SCAN_RUNNING case falls
> through to the ATH10K_SCAN_ABORTING case in __ath10k_scan_finish.  This
> will document that the lack of a break is intentional.
>
> Coverity: CID 1260017
>
> Signed-off-by: John W. Linville <linville@tuxdriver.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
