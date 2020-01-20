Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itZ7g-0000uK-M6
 for ath10k@lists.infradead.org; Mon, 20 Jan 2020 15:37:58 +0000
Received: by mail-ot1-x341.google.com with SMTP id 77so101783oty.6
 for <ath10k@lists.infradead.org>; Mon, 20 Jan 2020 07:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <CAMrEMU-UTtxJ-eMoNEBONXJCTpaZCcGc8Mu34wqQNXkpVz=gJA@mail.gmail.com>
 <55ab2d64e78d51a9da587f276899e08b@codeaurora.org>
 <a1950ee2cb8dd9fc10e7d31bf18c9c95@codeaurora.org>
 <CAMrEMU8DmXBGGU-WNd9bQAVVkHF6SCO7c_wv+dyH9D7KFOB8jw@mail.gmail.com>
 <7ad4db8ea256a823778edf89b2a1b2fc@codeaurora.org>
In-Reply-To: <7ad4db8ea256a823778edf89b2a1b2fc@codeaurora.org>
From: Justin Capella <justincapella@gmail.com>
Date: Mon, 20 Jan 2020 07:37:39 -0800
Message-ID: <CAMrEMU98aMAfJdxECYPfLgqLC-zp1rA4K+DkWz=v3bTehMaoiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
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

Sorry, that response was intended for the start retries.

On Mon, Jan 20, 2020 at 5:34 AM Wen Gong <wgong@codeaurora.org> wrote:
>
> On 2020-01-20 17:38, Justin Capella wrote:
> > Ok thanks. I am still trying to familiarize myself with ath10k. A
> > couple things come to mind:
> >
> > firstly recently there was a patch that set stations back to
> > associated during recovery, do you know if the branch you're working
> > against includes that? I will try to figure that out myself but it's
> > at least worth considering.
> >
> can you give the patch link or patch?
>
> > If I remember correctly, the sdio rx involves peeking and checking to
> > see if the frame/packet continues/has more. In the case of firmware
> > recovery/reconfig I think current code enables all sorts of debug
> > pktlog stuff, historically it was maybe used as a hack to check for hw
> > changes... But I mention it because I think what might be happening in
> > some cases is fw crash follows a frame that would continue/extend,
> > which is messing with the content and act_len (maybe?)
> does it have relation with this patch?
> >
> > I also noticed that with aggregation I wind up getting a
> > deauth/dissasoc followed by mlme delete sta/peer/key.
> >
> does it have relation with this patch?
> > I think a retry count could be useful but what do you think of maybe
> > using an event / timeout?
> >
> does it have relation with this patch?
>
> >
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
