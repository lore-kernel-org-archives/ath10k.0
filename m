Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibSrs-0003Fm-Jk
 for ath10k@lists.infradead.org; Sun, 01 Dec 2019 17:18:45 +0000
Received: by mail-ot1-x32c.google.com with SMTP id x3so4416169oto.11
 for <ath10k@lists.infradead.org>; Sun, 01 Dec 2019 09:18:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMrEMU8A49OwSPKN+YP7z5LYjiopNpEq-MdACBvkZi6W=vJO9Q@mail.gmail.com>
 <CAJ-VmokD1E8s99PE-XhDkmu=dzkFB0r_QvV_0z6cbHcC3j0FHA@mail.gmail.com>
In-Reply-To: <CAJ-VmokD1E8s99PE-XhDkmu=dzkFB0r_QvV_0z6cbHcC3j0FHA@mail.gmail.com>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 1 Dec 2019 09:18:25 -0800
Message-ID: <CAMrEMU_nahLwE39DX=6e=Pr9S8R7oyC0mFFCqis4b8-FPC80YA@mail.gmail.com>
Subject: Re: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

No Apply devices--- Android (BRCM?), and Linux iwlwifi. I guess I
could have left the OUI's in the MACs.... But it is a recent
regression and multiple clients (all my devices) seem to be impacted.

On Sun, Dec 1, 2019 at 9:01 AM Adrian Chadd <adrian@freebsd.org> wrote:
>
> Are these er, apple devices?
>
>
>
> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
