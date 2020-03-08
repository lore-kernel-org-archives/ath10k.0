Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jApD3-0005Co-F9
 for ath10k@lists.infradead.org; Sun, 08 Mar 2020 06:14:46 +0000
Received: by mail-vs1-xe29.google.com with SMTP id u24so4118663vso.11
 for <ath10k@lists.infradead.org>; Sat, 07 Mar 2020 22:14:44 -0800 (PST)
MIME-Version: 1.0
From: Justin Capella <justincapella@gmail.com>
Date: Sat, 7 Mar 2020 22:16:19 -0800
Message-ID: <CAMrEMU-8A5scsr-sXdKYa9fO+AGVDWafMz2km5KnAu2R31H5rw@mail.gmail.com>
Subject: Re: ath10k: add QCA9377 sdio hw_param item
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
To: "erik.stromdahl@gmail.com" <erik.stromdahl@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

> >> +            .hw_ops = &qca6174_ops,
> >> +            .hw_clk = qca6174_clk,


Would it be worthwhile to refactor / rename these? I also recall there
being a qca6174_sdio_ops

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
