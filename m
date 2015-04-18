Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ie0-x22e.google.com ([2607:f8b0:4001:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yjcc8-0007Gl-6o
 for ath10k@lists.infradead.org; Sat, 18 Apr 2015 23:57:32 +0000
Received: by iecrt8 with SMTP id rt8so82322278iec.0
 for <ath10k@lists.infradead.org>; Sat, 18 Apr 2015 16:57:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADxDmp4USuF-qFY50NFfKcYcwd-fHs9AT662aWi8UEsBcapixw@mail.gmail.com>
References: <CADxDmp4USuF-qFY50NFfKcYcwd-fHs9AT662aWi8UEsBcapixw@mail.gmail.com>
Date: Sat, 18 Apr 2015 16:57:09 -0700
Message-ID: <CAJ-VmonxThhkHaHe_vRH0eNToPtt9ZfhsyJ2LkgkKhf-A3HZ0w@mail.gmail.com>
Subject: Re: A-MPDUs in 20/40 mode
From: Adrian Chadd <adrian.chadd@gmail.com>
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
To: Kamran Nishat <kamran.nishat@gmail.com>
Cc: ath9k-devel <ath9k-devel@lists.ath9k.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, ath9k-devel <ath9k-devel@venema.h4ckr.net>

Hi,

So only the /final/ details in the last RX descriptor is valid. It's
possible that the rest of them are corrupted/previous packets.



-a


On 18 April 2015 at 12:57, Kamran Nishat <kamran.nishat@gmail.com> wrote:
>  Hi,
>  according to wireshark (radiotap.mcs.bw field) some MPDUs in an
> A-MPDU are recieved at 40Mhz while others are reiceved at 20Mhz. AP is
> working in 20/40 mixed mode. I dont think bandwidth change within an
> A-MPDU is possible. Is there a bug in wireshark or in my
> inderstanding?
>
> kamran

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
