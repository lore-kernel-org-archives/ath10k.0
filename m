Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZK5X-0003HK-9C
 for ath10k@lists.infradead.org; Thu, 02 Feb 2017 16:18:25 +0000
Received: by mail-wj0-f194.google.com with SMTP id kq3so1553888wjc.3
 for <ath10k@lists.infradead.org>; Thu, 02 Feb 2017 08:18:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 2 Feb 2017 08:17:00 -0800
Message-ID: <CAJ-VmonrHpS3MArM9ohHgLvb6xspP_gnVVeJWA9F-pjUpJ+LZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: remove ath10k_vif_to_arvif()
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
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeusz.slawinski@tieto.com>
Cc: netdev@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

hiya,

Removing this method makes the diff to FreeBSD larger, as "vif" in
FreeBSD is a different pointer.

(Yes, I have ath10k on freebsd working and I'd like to find a way to
reduce the diff moving forward.)



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
