Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW1Ea-0006tr-Si
 for ath10k@lists.infradead.org; Mon, 22 Sep 2014 10:52:45 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: dump hex bytes with dev string prefix
References: <1411046721-20510-1-git-send-email-michal.kazior@tieto.com>
 <1411046721-20510-3-git-send-email-michal.kazior@tieto.com>
Date: Mon, 22 Sep 2014 13:52:05 +0300
In-Reply-To: <1411046721-20510-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 18 Sep 2014 15:25:20 +0200")
Message-ID: <877g0wlyga.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This makes it easier to debug hex dumps on systems
> with more than a single ath10k device.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> -		print_hex_dump_bytes(prefix, DUMP_PREFIX_OFFSET, buf, len);
> +		for (ptr = buf; (ptr - buf) < len; ptr += 16) {
> +			linebuflen = 0;
> +			if (prefix)
> +				linebuflen += scnprintf(linebuf + linebuflen,
> +							sizeof(linebuf) -
> +							linebuflen,
> +							"%s", prefix);
> +			linebuflen += scnprintf(linebuf + linebuflen,
> +						sizeof(linebuf) - linebuflen,
> +						"%08x: ",
> +						(unsigned int)(ptr - buf));
> +			hex_dump_to_buffer(ptr, len - (ptr - buf), 16, 1,
> +					   linebuf + linebuflen,
> +					   sizeof(linebuf) - linebuflen, true);
> +			dev_printk(KERN_DEBUG, ar->dev, "%s\n", linebuf);
> +		}

Would it be possible to simplify this to one scnprintf()? Something
like:

linebuflen += scnprintf(linebuf + linebuflen,
			sizeof(linebuf) - linebuflen,
			"%s%08x: ",
                        prefix ? prefix : "",
			(unsigned int)(ptr - buf));

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
