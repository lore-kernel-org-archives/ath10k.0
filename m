Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvpfs-0004MD-MZ
 for ath10k@lists.infradead.org; Mon, 09 Nov 2015 16:52:10 +0000
Received: by ykek133 with SMTP id k133so274754274yke.2
 for <ath10k@lists.infradead.org>; Mon, 09 Nov 2015 08:51:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
References: <1446713443-22542-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 9 Nov 2015 17:51:45 +0100
Message-ID: <CACKGw+FsY0nK4ppyhOXLfD2JgZHhDFyfbpeCv+5hixfHPyuZUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] update ath10k support for QCA9377 chips
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: ath10k <ath10k@lists.infradead.org>

On 5 November 2015 at 09:50, Bartosz Markowski
<bartosz.markowski@tieto.com> wrote:
> * Clarifying the naming scheme for QCA9377 targets
> * Adding the dev_id mathod (RFC) as a HW identification helper
> * updating missing hw_params for 1.1 target

Linking the ubuntu forum thread and some good news from the Acer E15
owners: http://ubuntuforums.org/showthread.php?t=2300861

> ---
>
> Notes:
>   v2:
>    * rebase
>    * fix the whitespace mess in patch 4/4 [Kalle]
>
> Bartosz Markowski (4):
>   ath10k: fix the currently supported QCA9377 target version name
>   ath10k: update missing hw_params of QCA9377 hw1.1
>   ath10k: introduce dev_id to hw_params
>   ath10k: add QCA9377 hw1.0 support
>
>  drivers/net/wireless/ath/ath10k/core.c | 49 ++++++++++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath10k/core.h |  1 +
>  drivers/net/wireless/ath/ath10k/hw.h   | 17 ++++++++++--
>  drivers/net/wireless/ath/ath10k/pci.c  |  8 ++----
>  4 files changed, 65 insertions(+), 10 deletions(-)
>
> --
> 2.1.2
>



-- 
Bartosz Markowski, Software Architect

Tieto Poland Sp. z o.o., Product Development Services
Swobodna 1 st., 50-088 Wroclaw, Poland
email bartosz.markowski@tieto.com, mobile +48 668 168 256,
www.tieto.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
