Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga2MH-0000Qr-IW
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:43:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id r136so1257281pfc.6
 for <ath10k@lists.infradead.org>; Thu, 20 Dec 2018 09:43:30 -0800 (PST)
Date: Thu, 20 Dec 2018 09:43:26 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: Move non-fatal warn logs to dbg level
Message-ID: <20181220174324.GA67805@google.com>
References: <20181129042522.11767-1-govinds@codeaurora.org>
 <CA+ASDXMOqzXk9HrX9AS58cUfKOHeXA7zN_ME3+zDZXQcok_0Tg@mail.gmail.com>
 <87h8f8talw.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h8f8talw.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: govinds@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Dec 20, 2018 at 06:40:43PM +0200, Kalle Valo wrote:
> Brian Norris <briannorris@chromium.org> writes:
> > Alternatively, you could add these ignored commands to wmi-tlv.h, and
> > just ignore them specifically. That's better documentation, in case
> > new WMI events come along that *are* important to notice when we
> > ignore them. There are other recent examples of that sort of patch
> > being merged.
> 
> I have actually tried to do that (what Brian describes above) during the
> last years but the problem is that there are just so many different
> firmware branches that it's difficult to keep up in ath10k. So in the
> end these warnings just confused the users and they mistakenly thought
> this warning message is the cause of their problems. That's why I think
> it's best to remove this warning.

Thanks for the background. To be clear, I'm perfectly fine with this
patch too. I was mostly just volunteering an alternative, in case it
*was* your intention as maintainer to keep it this way.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
