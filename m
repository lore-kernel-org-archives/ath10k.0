Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcT7Z-0004mj-Kn
 for ath10k@lists.infradead.org; Mon, 30 Mar 2015 06:24:26 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ath10k: add ATH10K_FW_IE_HTT_OP_VERSION
References: <20150325110835.30133.509.stgit@x230>
Date: Mon, 30 Mar 2015 09:23:51 +0300
In-Reply-To: <20150325110835.30133.509.stgit@x230> (Kalle Valo's message of
 "Wed, 25 Mar 2015 13:12:13 +0200")
Message-ID: <87619j6m14.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> My proposal how to solve the differences between HTT interfaces by adding
> ATH10K_FW_IE_HTT_OP_VERSION. Based on Rajkumar's "ath10k: fix htt t2h message
> conflicts among firmware revisions", I just added the new IE and bumped up the
> FW API.
>
> For now only compile tested, I will run proper tests later.
>
> ---
>
> Kalle Valo (1):
>       ath10k: bump up FW API to 5
>
> Rajkumar Manoharan (1):
>       ath10k: add ATH10K_FW_IE_HTT_OP_VERSION

Applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
