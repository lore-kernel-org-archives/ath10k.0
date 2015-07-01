Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAPtu-0006qs-7J
 for ath10k@lists.infradead.org; Wed, 01 Jul 2015 21:50:39 +0000
Received: by wiwl6 with SMTP id l6so178294096wiw.0
 for <ath10k@lists.infradead.org>; Wed, 01 Jul 2015 14:50:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5594343C.1050802@candelatech.com>
References: <5594343C.1050802@candelatech.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Wed, 1 Jul 2015 14:49:45 -0700
Message-ID: <CAD1M061-UOFoGgS4J_nSLoSRG7WxOFCHb=5fi6-2knXt7d02Pw@mail.gmail.com>
Subject: Re: ath10k on 4.9 band?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hi Ben,

On Wed, Jul 1, 2015 at 11:41 AM, Ben Greear <greearb@candelatech.com> wrote:
> Anyone know what it would take to make ath10k work on the 4.9Ghz band?
>
> Thanks,
> Ben

Yes. First you have to update your regulatory database to allow for
4.9GHz in whatever country you're wanting (wireless/db.txt). Then you
update ath10k driver to add the channels.

Update core.h to increase the number of channels allowed. Then update
mac.c and add the 4.9 frequencies to the 5ghz_channels struct.
Depending on the radio's EEPROMs regulatory restrictions, you'll have
to hack up wireless/ath/regd.c as well. I haven't done this in several
months, but I don't think that anything in the ath10k driver has
changed enough to modify my instructions.

- Pushpal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
