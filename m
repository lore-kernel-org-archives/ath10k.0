Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itLh1-0000Fm-Uf
 for ath10k@lists.infradead.org; Mon, 20 Jan 2020 01:17:30 +0000
Received: by mail-ot1-x342.google.com with SMTP id 59so27252758otp.12
 for <ath10k@lists.infradead.org>; Sun, 19 Jan 2020 17:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20200117083605.392-1-wgong@codeaurora.org>
In-Reply-To: <20200117083605.392-1-wgong@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 19 Jan 2020 17:17:14 -0800
Message-ID: <CAMrEMU-57qrCP3Kh_cna-QNCBfGu6G3e0Y_0-wg6axq_EuoCcw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add retry mechanism for ath10k_start
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

Is the same address always used for "struct ath10k *ar = hw->priv" --
even when driver is stopped / bus errors are encountered? If not this
could potentially be use after free scenario?

Most code tries to protect the ->state with the config mutex, might
need to do that here too

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
