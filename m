Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOlyt-0007Qg-Gp
 for ath10k@lists.infradead.org; Mon, 10 Aug 2015 12:15:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: qca6164 support
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
Date: Mon, 10 Aug 2015 15:14:35 +0300
In-Reply-To: <CA+BoTQmb-2arpqmxmiWoTL9OFFtU9hEsrHdCmfAsWiNzE=5C-A@mail.gmail.com>
 (Michal Kazior's message of "Mon, 10 Aug 2015 10:48:54 +0200")
Message-ID: <87pp2vwdas.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Anish Tondwalkar <twilightrook@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

>> This patch?
>>
>> https://github.com/vvanpo/linux/commit/22f8a4083883eca3e8a3175315d67d2a04392466
>
> Yes. Make sure you have the right (i.e. including the change) ath10k
> module loaded, please.

For test patches I recommend adding a printk to make it easier to verify
that the patch is really used. It's so easy to do something wrong and
use wrong module.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
