Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xhfm0-00067G-PU
 for ath10k@lists.infradead.org; Fri, 24 Oct 2014 14:23:26 +0000
Received: by mail-lb0-f179.google.com with SMTP id l4so2644908lbv.38
 for <ath10k@lists.infradead.org>; Fri, 24 Oct 2014 07:22:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lho5muz6.fsf@kamboji.qca.qualcomm.com>
References: <1413823085-3187-1-git-send-email-yanbol@qti.qualcomm.com>
 <87lho5muz6.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 24 Oct 2014 22:22:59 +0800
Message-ID: <CAFuUQkj2Nn8TVQAHHUCNP+90zfUe0XSWWVQqVL_2C6bO524PVg@mail.gmail.com>
Subject: Re: [PATCH v3] Add the target register read/write and memory dump
 debugfs interface
From: YanBo <dreamfly281@gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Yanbo Li <yanbol@qti.qualcomm.com>, senthilb@qti.qualcomm.com, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Fri, Oct 24, 2014 at 9:57 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Yanbo Li <yanbol@qti.qualcomm.com> writes:
>
> > The debugfs interface reg_addr&reg_val used to read and write the target
> > register.
> > The interface mem_addr&mem_val used to dump the targer memory and also
> > can be used to assign value to target memory
>
> I think you got the mail from kbuild bot already, but this patch has a
> sparse warning:
>
> >> drivers/net/wireless/ath/ath10k/debug.c:1182:26: sparse: incorrect type in assignment (different base types)
>    drivers/net/wireless/ath/ath10k/debug.c:1182:26:    expected restricted __le32 [usertype] <noident>
>    drivers/net/wireless/ath/ath10k/debug.c:1182:26:    got unsigned int [unsigned] [addressable] [usertype] mem_val
>

Thanks for checking, will fix in local and submit again together with
Michal's suggestion.

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
