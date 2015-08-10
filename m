Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOili-00025j-7y
 for ath10k@lists.infradead.org; Mon, 10 Aug 2015 08:49:18 +0000
Received: by wicne3 with SMTP id ne3so126762310wic.1
 for <ath10k@lists.infradead.org>; Mon, 10 Aug 2015 01:48:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALZPV0DsQXPfq3+O-8iF4H8i1-164s2jRdvmQjMMnW-qd7reFA@mail.gmail.com>
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
Date: Mon, 10 Aug 2015 10:48:54 +0200
Message-ID: <CA+BoTQmb-2arpqmxmiWoTL9OFFtU9hEsrHdCmfAsWiNzE=5C-A@mail.gmail.com>
Subject: Re: qca6164 support
From: Michal Kazior <michal.kazior@tieto.com>
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
To: Anish Tondwalkar <twilightrook@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10 August 2015 at 10:27, Anish Tondwalkar <twilightrook@gmail.com> wrote:
>
> On Aug 10, 2015 04:16, "Michal Kazior" <michal.kazior@tieto.com> wrote:
>>
>>
>> This register dump (0x000A012D) suggests you dont have the necessary
>> patch for qca6164.
>
> This patch?
>
> https://github.com/vvanpo/linux/commit/22f8a4083883eca3e8a3175315d67d2a04392466

Yes. Make sure you have the right (i.e. including the change) ath10k
module loaded, please.


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
