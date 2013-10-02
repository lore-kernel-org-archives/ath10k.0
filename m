Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRQU8-0000of-Vr
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 17:45:18 +0000
Received: by mail-la0-f52.google.com with SMTP id ev20so927281lab.25
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2013 10:44:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380696054.2081.35.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Date: Wed, 2 Oct 2013 10:44:32 -0700
Message-ID: <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
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
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On Tue, Oct 1, 2013 at 11:40 PM, Joe Perches <joe@perches.com> wrote:
> Please include netdev.  (cc'd)
>
>> Joe Perches <joe@perches.com> writes:
>>
>> > Convert the memset/memcpy uses of 6 to ETH_ALEN
>> > where appropriate.
>
>> > Signed-off-by: Joe Perches <joe@perches.com>

I think these sorts of patches are good -- but once applied it'd be
good if we can get the SmPL grammar expressed for it and then have
developers / maintainers regularly doing:

make coccicheck MODE=patch M=path > path-cocci.patch

Unfortunately right now MODE=patch takes about 3 1/2 minutes for
ath9k, MODE=org takes ~10 minutes for ath9k (17 minutes for all of
ath/), and MODE=context takes ~8 minutes on ath9k -- I do believe its
a bit unreasonable to expect patch submitters to use this, but
certainly great practice. Some of the time differences on the reports
can be explained by the fact that some SmPL will only be used for some
modes.

Even though it takes a while right now it'd be great practice to use
coccicheck to prevent these type of changes from going in again,
things that checkpatch.pl won't be able to catch.

  Luis

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
