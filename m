Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN0gA-0004iK-6q
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 15:32:30 +0000
Received: by vkhg129 with SMTP id g129so16867281vkh.2
 for <ath10k@lists.infradead.org>; Wed, 05 Aug 2015 08:32:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMQd7mb63mBBP2V2kts7Y9K5TO25vp3E1RgGsF9-FL8hgxgZ+g@mail.gmail.com>
References: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
 <CAMQd7mb63mBBP2V2kts7Y9K5TO25vp3E1RgGsF9-FL8hgxgZ+g@mail.gmail.com>
Date: Wed, 5 Aug 2015 11:32:08 -0400
Message-ID: <CALiJtcro6PzcFjJBt38UrZFwoM0BYU7x=Btw+k75Q1ryr2SU_Q@mail.gmail.com>
Subject: Re: qca6164 support
From: Victor van Poppelen <vvanpo@gmail.com>
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
To: Enrico Tagliavini <enrico.tagliavini@gmail.com>
Cc: ath10k@lists.infradead.org

> I think you should have called your firmwware firmware-4.bin and not
> -5.bin. In fact in the top of the file I have it says ">
> firmware-4.bin". File names matters as far as I understood. Feel free
> to check archives of this list I saw somebody talking about this
> argument not long ago.

I admit I foolishly only changed the name to firmware-5.bin to prevent
the minute-long timeout (can we do something about that?), which is
probably the same reason why others were doing it.  But in looking
through the code, I can't find anywhere where the value of ar->fw_api
actually affects driver behaviour.  Could you point me to where this
value becomes important?

Victor

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
