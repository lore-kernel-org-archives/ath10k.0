Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVRni-0002aW-E0
 for ath10k@lists.infradead.org; Tue, 28 May 2019 02:25:20 +0000
Subject: RE: [PATCH] ath10k: add support for simulate crash on SDIO chip
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Tue, 28 May 2019 02:25:07 +0000
Message-ID: <9d7964c815c54582a304e49e4667c0f5@aptaiexm02f.ap.qualcomm.com>
References: <1555406865-21514-1-git-send-email-wgong@codeaurora.org>
 <CANMq1KBjupZeuw3hmQHbYui4G9+Ni7SPPE1SNqG9=89iVhFjgg@mail.gmail.com>
In-Reply-To: <CANMq1KBjupZeuw3hmQHbYui4G9+Ni7SPPE1SNqG9=89iVhFjgg@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Nicolas Boichat <drinkcat@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: Claire Chang <tientzu@chromium.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Nicolas
> Boichat
> Sent: Monday, April 29, 2019 1:21 PM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: Claire Chang <tientzu@chromium.org>; linux-wireless@vger.kernel.org;
> ath10k@lists.infradead.org
> Subject: [EXT] Re: [PATCH] ath10k: add support for simulate crash on SDIO
> chip
> 
> Err, so you consider _any_ CPU interrupt to be caused by the FW
> crashing? Is that correct? If so, please at least add a comment.
> 
> Otherwise, maybe you should run this only if
> MBOX_CPU_STATUS_ENABLE_ASSERT_MASK is set in cpu_int_status?
> 
> >         return ret;
> >  }
> >

Hi Nicolas,
New patch has uploaded for the change
https://patchwork.kernel.org/patch/10921341/
[v2] ath10k: add support for simulate crash on SDIO chip

https://patchwork.kernel.org/patch/10955189/
[v3] ath10k: add support for firmware crash recovery on SDIO chip

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
