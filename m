Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0135.hostedemail.com ([216.40.44.135]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anUn5-0000tc-2X
 for ath10k@lists.infradead.org; Tue, 05 Apr 2016 17:29:26 +0000
Message-ID: <1459877336.6715.6.camel@perches.com>
Subject: Re: [PATCH] ath10k: Fix return value for btcoex and peer stats debugfs
From: Joe Perches <joe@perches.com>
Date: Tue, 05 Apr 2016 10:28:56 -0700
In-Reply-To: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1459870106-2694-1-git-send-email-mohammed@qca.qualcomm.com>
Mime-Version: 1.0
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, ath10k@lists.infradead.org, Yanbo Li <yanbol@qca.qualcomm.com>
Cc: mohammed@codeaurora.org, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, kvalo@codeaurora.org

On Tue, 2016-04-05 at 20:58 +0530, Mohammed Shafi Shajakhan wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> =

> Return value is incorrect for btcoex and peer stats debugfs
> 'write' entries if the user provides a value that matches with
> the already available debugfs entry, this results in the debugfs
> entry getting stuck and the operation has to be terminated manually.
> Fix this by returning the appropriate return 'count' as we do it for
> other debugfs entries like pktlog etc

Not your code, but some of the xor uses are odd at best.

> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wirele=
ss/ath/ath10k/debug.c
[]
> @@ -2122,7 +2122,7 @@ static ssize_t ath10k_write_btcoex(struct file *fil=
e,
> =A0	struct ath10k *ar =3D file->private_data;
> =A0	char buf[32];
> =A0	size_t buf_size;
> -	int ret =3D 0;
> +	int ret;
> =A0	bool val;
> =A0
> =A0	buf_size =3D min(count, (sizeof(buf) - 1));
> @@ -2142,8 +2142,10 @@ static ssize_t ath10k_write_btcoex(struct file *fi=
le,
> =A0		goto exit;
> =A0	}
> =A0
> -	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val))
> +	if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val)) {

xor on an int and a bool.

> @@ -2189,7 +2191,7 @@ static ssize_t ath10k_write_peer_stats(struct file =
*file,
> =A0	struct ath10k *ar =3D file->private_data;
> =A0	char buf[32];
> =A0	size_t buf_size;
> -	int ret =3D 0;
> +	int ret;
> =A0	bool val;
> =A0
> =A0	buf_size =3D min(count, (sizeof(buf) - 1));
> @@ -2209,8 +2211,10 @@ static ssize_t ath10k_write_peer_stats(struct file=
 *file,
> =A0		goto exit;
> =A0	}
> =A0
> -	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val))
> +	if (!(test_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags) ^ val)) {

here too


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
