Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPCMi-0002VK-2K
 for ath10k@lists.infradead.org; Tue, 11 Aug 2015 16:25:29 +0000
Received: by pabyb7 with SMTP id yb7so133432700pab.0
 for <ath10k@lists.infradead.org>; Tue, 11 Aug 2015 09:25:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnva5HOMczy-k3Y4AEDac4Tat7Vu0zOFv+cXzRfboEP7g@mail.gmail.com>
References: <CALiJtcqant1xGJTPpMpHj+zVAcY7gfN8UXy30sAdSd9QvsPJ1Q@mail.gmail.com>
 <CA+BoTQkvsrWBv8NceYuaK4mAnbg-bjzgB+voMAq7YNBcpUA8nw@mail.gmail.com>
 <CA+BoTQnvLqzTA8sthybeGTkPeEFYBkynTOGNQSdqh4SaUpqjBA@mail.gmail.com>
 <CALiJtcodKtPDHdu4diX-jmfxWdKtAiBfQunJQMbG_eYjrm3brg@mail.gmail.com>
 <CA+BoTQ=iM_8HWy1X8D9vqqxh=grnygy+mZtC6Q=YGjaZLSQmuA@mail.gmail.com>
 <CALiJtco-atqjBVi2jXxSFeoRQFRqu4jQu3vMmYNexkeEg6rHAQ@mail.gmail.com>
 <loom.20150810T055401-106@post.gmane.org>
 <CA+BoTQ=Rga-E3HMciQKdECHF=hNqBro_Pq=H8KH5Uy4rV0m58w@mail.gmail.com>
 <CALZPV0B9sVgbUrv6DTZ6t48QyHNQM_e0hV+mUC-svAZbvJK_vg@mail.gmail.com>
 <CA+BoTQkXnzHbmPCOd7YX7qN7mv4c3NNLZmLf3JYb_r+vA=sUvw@mail.gmail.com>
 <CALZPV0DsQXPfq3+O-8iF4H8i1-164s2jRdvmQjMMnW-qd7reFA@mail.gmail.com>
 <CA+BoTQmb-2arpqmxmiWoTL9OFFtU9hEsrHdCmfAsWiNzE=5C-A@mail.gmail.com>
 <CALZPV0D6hVGgw9bO0W+uz3vCw3WqaGXwnH6SpdQ1+JjBMS6ghQ@mail.gmail.com>
 <CA+BoTQn=09AWB-ZZNGYQo2X1CUYnnwxcROW09QgXpn9y8P_0oA@mail.gmail.com>
 <CALZPV0CebKaJO+jRj1okMAHvcufAjY+Hz=3YU12U-3N+9HfTeQ@mail.gmail.com>
 <CALZPV0A-zUCh9YwEvOrfiCPF8J3ED6ihOBW3J3D_zCnLAmyzWg@mail.gmail.com>
 <CALZPV0CNE8XzV5NKjv4s+f21WguB6EOQ2WMMteAEMfJKW2caRQ@mail.gmail.com>
 <CA+BoTQnva5HOMczy-k3Y4AEDac4Tat7Vu0zOFv+cXzRfboEP7g@mail.gmail.com>
Date: Tue, 11 Aug 2015 12:25:06 -0400
Message-ID: <CALZPV0CVv56SiMaYzFJT_C-q1X73iDqHNxJUu0v9nm5ZnZcV+g@mail.gmail.com>
Subject: Re: qca6164 support
From: Anish Tondwalkar <twilightrook@gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Aug 11, 2015 at 2:00 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> Apparently it is important to have an adequate board.bin or otp.bin to
> even boot qca6164. I suspect it's only board.bin but it'd be nice to
> know for sure what triggers the device crash.
>
> Can you verify this by using firmware-X.bin from sumdog and board.bin
> from vvanpo, and then the opposite, i.e. firmware-X.bin from vvanpo
> and board.bin from sumdog and report which one of the two worked,
> please?

You are correct. vvanpo board.bin + sumdog firmware-5.bin works perfectly!

-- 
Anish

Q: Why is this email two sentences or less?
A: http://two.sentenc.es

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
