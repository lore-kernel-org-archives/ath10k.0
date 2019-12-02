Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibcsj-0002Nr-MU
 for ath10k@lists.infradead.org; Mon, 02 Dec 2019 04:00:19 +0000
Received: by mail-oi1-x235.google.com with SMTP id k196so14789700oib.2
 for <ath10k@lists.infradead.org>; Sun, 01 Dec 2019 20:00:12 -0800 (PST)
MIME-Version: 1.0
References: <CAMrEMU8A49OwSPKN+YP7z5LYjiopNpEq-MdACBvkZi6W=vJO9Q@mail.gmail.com>
 <CAJ-VmokD1E8s99PE-XhDkmu=dzkFB0r_QvV_0z6cbHcC3j0FHA@mail.gmail.com>
 <CAMrEMU_nahLwE39DX=6e=Pr9S8R7oyC0mFFCqis4b8-FPC80YA@mail.gmail.com>
 <CAJ-Vmo=RZNXi273vGp+4H_mQVGghKeeMSOUpStz+wXQq=awCqA@mail.gmail.com>
 <CAMrEMU-v9GDt_=MMgxsxqk0zw33Bzf0AY5G4XHmv6d3ecV_zPA@mail.gmail.com>
In-Reply-To: <CAMrEMU-v9GDt_=MMgxsxqk0zw33Bzf0AY5G4XHmv6d3ecV_zPA@mail.gmail.com>
From: Justin Capella <justincapella@gmail.com>
Date: Sun, 1 Dec 2019 19:59:57 -0800
Message-ID: <CAMrEMU-N0nAVgkJfnA0VZ8vC4RWYZqkuzLymPC3cS-_aOMO2=Q@mail.gmail.com>
Subject: Fwd: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
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

Sorry newb move--- forgot to include the list

---------- Forwarded message ---------
From: Justin Capella <justincapella@gmail.com>
Date: Sun, Dec 1, 2019 at 7:58 PM
Subject: Re: duplicate authentications / excessive missing ACKs /
deauth due to inactivity timer
To: Adrian Chadd <adrian@freebsd.org>


http://ix.io/23lo Included iw phy / iw dev in this paste.

The multiple print's of the associations/starting sessions makes me
feel like the packets are being processed multiple times.

I'd like to bring attention to this commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/net/wireless/ath/ath10k?h=v4.19.84&id=a4bf4fecff16f30814922679a131331f2c3aabf8

I notice that the check here is different logic, using BITS_PER_TYPE
in other places I see comparisons against ATH10K_MAX_NUM_PEER_IDS, is
this correct? My thought was if maybe I have many clients (11?) that
maybe this prevents the removal of the peer... but I admit to not
understanding all the nuances of the 80211 stack yet.

Would a inline/utility type function to centralize these sorts of
checks be worthwhile?


On Sun, Dec 1, 2019 at 9:21 AM Adrian Chadd <adrian@freebsd.org> wrote:
>
> It'd be good to at least post the client devices, with the
> kernel/firmware versions if you know them. That way people can check
> for regressions.
>
>
> -a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
