Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d20oZ-0005AL-5Q
 for ath10k@lists.infradead.org; Sat, 22 Apr 2017 19:35:28 +0000
Received: by mail-lf0-x242.google.com with SMTP id 75so12542739lfs.3
 for <ath10k@lists.infradead.org>; Sat, 22 Apr 2017 12:35:06 -0700 (PDT)
Subject: Re: [PATCH v7 00/10] ath10k: sdio support
References: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <15e7a765-d5f0-677a-51a9-e2a74ef6ed33@gmail.com>
Date: Sat, 22 Apr 2017 21:35:02 +0200
MIME-Version: 1.0
In-Reply-To: <149207201649.4590.5821794186383265138.stgit@potku.adurom.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org



On 2017-04-13 10:28, Kalle Valo wrote:
> More changes to Erik's SDIO patches. The biggest change in this round
> is refactoring of the ugly ath10k_sdio_io() function.
>
> Only compile tested, I don't have any SDIO boards at the moment.
>
I have tested the patches and they are working as expected...

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
