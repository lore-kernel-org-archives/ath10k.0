Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSnv1-0003dJ-2M
 for ath10k@lists.infradead.org; Mon, 20 May 2019 19:25:56 +0000
Received: by mail-yw1-f41.google.com with SMTP id n76so6328432ywd.1
 for <ath10k@lists.infradead.org>; Mon, 20 May 2019 12:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
 <cdfa7b09-4e32-a62d-1bb6-d6128ba6594b@candelatech.com>
 <eae17245-eec2-96fe-34ff-f3800fae44d8@newmedia-net.de>
 <CAJ-Vmo=xhBvLmzec5mzf-gcFm1h6cQBLUOdVhuQjvbUWFjP-AQ@mail.gmail.com>
 <6378a260-0441-b985-6421-091f46d871f5@candelatech.com>
 <3d1db9ca-92a0-2bf7-5608-54e2b8e0476f@newmedia-net.de>
In-Reply-To: <3d1db9ca-92a0-2bf7-5608-54e2b8e0476f@newmedia-net.de>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 20 May 2019 12:25:41 -0700
Message-ID: <CAJ-VmonsmNVhzge5jiOVhJn13B8oWEop8zr=Xk+dgYZDTaGU+Q@mail.gmail.com>
Subject: Re: Problem with 9984 in routed mode with 512b frames.
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On Mon, 20 May 2019 at 09:59, Sebastian Gottschall
<s.gottschall@newmedia-net.de> wrote:


> the curious thing is still that the fallback code applies only for 2.4
> ghz so it would never have affected 802.11ac

Hm, does RC fall back to 11na or 11a rates when doing 11ac? (in 5G
mode.) It's good to know fixing that would fix it in 2.4GHz operation
but yeah, I wonder about RC in 5G.


-adian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
