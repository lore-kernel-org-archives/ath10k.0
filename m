Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ankRw-0007BB-Qd
 for ath10k@lists.infradead.org; Wed, 06 Apr 2016 10:12:37 +0000
Date: Wed, 6 Apr 2016 15:41:58 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix return value for btcoex and peer stats debugfs
Message-ID: <20160406101137.GA27525@atheros-ThinkPad-T61>
References: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
 <1459877336.6715.6.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1459877336.6715.6.camel@perches.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Joe Perches <joe@perches.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, Kalle Valo <kvalo@qca.qualcomm.com>, Yanbo Li <yanbol@qca.qualcomm.com>, kvalo@codeaurora.org

Hello Joe,

On Tue, Apr 05, 2016 at 10:28:56AM -0700, Joe Perches wrote:
> On Tue, 2016-04-05 at 20:58 +0530, Mohammed Shafi Shajakhan wrote:
> > From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> > =

> > Return value is incorrect for btcoex and peer stats debugfs
> > 'write' entries if the user provides a value that matches with
> > the already available debugfs entry, this results in the debugfs
> > entry getting stuck and the operation has to be terminated manually.
> > Fix this by returning the appropriate return 'count' as we do it for
> > other debugfs entries like pktlog etc
> =

> Not your code, but some of the xor uses are odd at best.

[shafi] ok.

> =

> > diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wire=
less/ath/ath10k/debug.c
> []
> > @@ -2122,7 +2122,7 @@ static ssize_t ath10k_write_btcoex(struct file *f=
ile,
> > =A0	struct ath10k *ar =3D file->private_data;
> > =A0	char buf[32];
> > =A0	size_t buf_size;
> > -	int ret =3D 0;
> > +	int ret;
> > =A0	bool val;
> > =A0
> > =A0	buf_size =3D min(count, (sizeof(buf) - 1));
> > @@ -2142,8 +2142,10 @@ static ssize_t ath10k_write_btcoex(struct file *=
file,
> > =A0		goto exit;
> > =A0	}
> > =A0
> > -	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val))
> > +	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val)) {
> =

> xor on an int and a bool.

[shafi] Should we change the 'val' to int, but this code seems to be working
test_bit seems to do this :
	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));

	do we see a problem, it should work right  (because they are bitwise
	'ANDING' with 1UL)

> =

> > @@ -2189,7 +2191,7 @@ static ssize_t ath10k_write_peer_stats(struct fil=
e *file,
> > =A0	struct ath10k *ar =3D file->private_data;
> > =A0	char buf[32];
> > =A0	size_t buf_size;
> > -	int ret =3D 0;
> > +	int ret;
> > =A0	bool val;
> > =A0
> > =A0	buf_size =3D min(count, (sizeof(buf) - 1));
> > @@ -2209,8 +2211,10 @@ static ssize_t ath10k_write_peer_stats(struct fi=
le *file,
> > =A0		goto exit;
> > =A0	}
> > =A0
> > -	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val))
> > +	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val)) {
> =

> here too

[shafi] same thing here ? is there a better code , kindly suggest

> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
