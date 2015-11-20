Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzkGn-0002fh-Ad
 for ath10k@lists.infradead.org; Fri, 20 Nov 2015 11:54:25 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA998X not working at all
References: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
 <1447826363-16818-1-git-send-email-michal.kazior@tieto.com>
 <1447826363-16818-10-git-send-email-michal.kazior@tieto.com>
 <564DE65C.9030407@dd-wrt.com> <564DEBBE.1040308@candelatech.com>
 <564DEC25.1030401@dd-wrt.com> <564DF53C.50009@candelatech.com>
 <564E02F1.3090306@dd-wrt.com> <564E130D.4080201@dd-wrt.com>
Date: Fri, 20 Nov 2015 13:53:40 +0200
In-Reply-To: <564E130D.4080201@dd-wrt.com> (Sebastian Gottschall's message of
 "Thu, 19 Nov 2015 19:21:01 +0100")
Message-ID: <87wptcsx8b.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> simple solution.
>
> as for ath9k. otp must be ignored for various chipsets, since they
> wont return valid results
>
> --- core.c (Revision 2702)
> +++ core.c (Arbeitskopie)
> @@ -1735,9 +1735,8 @@
>
>   ret = ath10k_core_get_board_id_from_otp(ar);
>   if (ret && ret != -EOPNOTSUPP) {
> -  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d\n",
> +  ath10k_err(ar, "failed to get board id from otp for qca99x0: %d,
> ignore\n",
>          ret);
> -  return ret;
>   }
>
>   ret = ath10k_core_fetch_board_file(ar);

I'm guessing in your case otp.bin crashes as the calibration data is in
flash (and not in otp). Can you send dmesg from a successful ath10k boot
so that I can verify ath10k reads the calibration data from a file?

I think I have an idea how to cleanly fix this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
