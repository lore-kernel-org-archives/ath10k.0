Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ej34J-0001P9-P9
 for ath10k@lists.infradead.org; Tue, 06 Feb 2018 13:13:57 +0000
Received: by mail-qt0-x229.google.com with SMTP id i8so2164820qtj.9
 for <ath10k@lists.infradead.org>; Tue, 06 Feb 2018 05:13:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHbf0-Eb3=OgpDLhgacYP4hcffh_9Y-iUj0GQAbzj2O9ag=z0A@mail.gmail.com>
References: <CAHbf0-Eb3=OgpDLhgacYP4hcffh_9Y-iUj0GQAbzj2O9ag=z0A@mail.gmail.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 6 Feb 2018 13:13:19 +0000
Message-ID: <CAHbf0-Hrq=2XGVPukEppm+n2Yg8x1UBXqk53io==27NzZK_s9w@mail.gmail.com>
Subject: Re: Regression in ath10k
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
To: linux-wireless@vger.kernel.org, yanhsu@codeaurora.org, valo@codeaurora.org, "Valo, Kalle" <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On 5 February 2018 at 22:38, Mike Lothian <mike@fireburn.co.uk> wrote:
> Hi
>
> Since the merge window opened I've been unable to see any wireless
> networks or join my usual access point
>
> I bisected this to:
>
> 9ed4f91628737c820af6a1815b65bc06bd31518f is the first bad commit
> commit 9ed4f91628737c820af6a1815b65bc06bd31518f
> Author: Ryan Hsu <ryanhsu@codeaurora.org>
> Date:   Tue Jan 16 11:43:49 2018 +0200
>
>    ath10k: add sanity check to ie_len before parsing fw/board ie
>
>    Validate ie_len after the alignment padding before access the buffer
>    to avoid potential overflow.
>
>    Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>
>    Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> And I can confirm that reverting the patch makes things work again (attached)
>
> Device:
>
> 3c:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac
> Wireless Network Adapter [168c:003e] (rev 32)
>
> Firmware:
>
> https://github.com/kvalo/ath10k-firmware
>
> ath10k-firmware/QCA6174/hw3.0/4.4.1.c1
>
> There was nothing obvious in the dmesg
>
> Regards
>
> Mike

Adding in the ath10k list and another email address for Kalle

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
