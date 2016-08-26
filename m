Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x235.google.com ([2607:f8b0:4001:c0b::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bdEh7-0003K5-IC
 for ath10k@lists.infradead.org; Fri, 26 Aug 2016 10:49:06 +0000
Received: by mail-it0-x235.google.com with SMTP id g62so1822247ith.1
 for <ath10k@lists.infradead.org>; Fri, 26 Aug 2016 03:48:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160826102250.24174-1-rmanohar@qti.qualcomm.com>
References: <20160826102250.24174-1-rmanohar@qti.qualcomm.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Fri, 26 Aug 2016 03:48:42 -0700
Message-ID: <CAA93jw7vHWROH9Ymq1UoOKA5kw+fDbCM=vJehs8J=QP2PVs_RA@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: implement NAPI support
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, ath10k <ath10k@lists.infradead.org>

I'm always rather big on people testing latency under load, and napi
tends to add some.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
