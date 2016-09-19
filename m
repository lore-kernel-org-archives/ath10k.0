Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blwVn-0007Q4-6C
 for ath10k@lists.infradead.org; Mon, 19 Sep 2016 11:13:24 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l132so4246093wmf.1
 for <ath10k@lists.infradead.org>; Mon, 19 Sep 2016 04:13:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <103bd80d-251b-fb13-82b6-a937ae75d949@gmail.com>
References: <103bd80d-251b-fb13-82b6-a937ae75d949@gmail.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 19 Sep 2016 13:13:00 +0200
Message-ID: <CA+BoTQ=sKophwu0VcYc+AuFTrwVEUm2m55BC5QEvA=VH8iUn3g@mail.gmail.com>
Subject: Re: ath10k: about packet injection
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
To: Xuebing Wang <xbing6@gmail.com>
Cc: David Liu <cfliu.tw@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 19 September 2016 at 01:27, Xuebing Wang <xbing6@gmail.com> wrote:
> Hi Community,
>
> ath10k wiki says packet injection isn't supported yet. Is it difficult to
> add packet injection for chip like QCA6174 hw 2.1 in Killer 1525? Thanks.

This would require some tricks:
 - monitor vdev can't tx so you'll need other vdev type allocated side-by-sdie
 - tx often may require peer entries (see offchan code in mac.c)
 - getting raw mode to work may be a problem and may require some
length-encoding hacks
 - injecting protected (software encrypted) frames might be a problem

Either way you're at the mercy of firmware blob :)


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
